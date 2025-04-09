//
//  ProductDetailsObservableObject.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//

import Observation
import SwiftDependencyInjector

/// Objeto observable responsable de gestionar el estado y lógica de negocio para la pantalla de detalles de producto.
///
/// `ProductDetailsObservableObject` interactúa con la capa de dominio para obtener los detalles de un producto,
/// mapea los datos a un modelo de presentación y expone el resultado para su consumo desde la interfaz de usuario.
///
/// Este objeto sigue el patrón `@Observable` y está diseñado para ser utilizado con SwiftUI.
@Observable
@MainActor
final class ProductDetailsObservableObject {
    
    /// Caso de uso que recupera los detalles de un producto desde el repositorio.
    @ObservationIgnored
    @Inject
    private var getProductDetailsUseCase: GetProductDetailsUseCaseProtocol
    
    /// Mapper que transforma la entidad de dominio en un modelo de UI.
    @ObservationIgnored
    @Inject
    private var detailsMapper: ProductDetailsUIMapper
    
    /// Identificador único del producto cuyos detalles se van a cargar.
    @ObservationIgnored
    private let id: String
    
    /// Modelo de presentación con la información del producto, expuesto para la vista.
    var product: ProductDetailsUIModel?
    
    /// Error capturado durante la carga de detalles del producto, si ocurre alguno.
    var detailsError: ProductDetailsError?
    
    /// Inicializa el observable con el `id` del producto.
    ///
    /// - Parameter id: Identificador único del producto a consultar.
    init(id: String) { self.id = id }
    
    /// Carga asincrónicamente los detalles del producto si aún no han sido cargados.
    ///
    /// Si ya existe un producto en memoria, la función no realiza ninguna acción.
    /// En caso de error, se captura el error específico de dominio.
    func loadDetails() async {
        do {
            guard product == nil else { return }
            
            let result = try await getProductDetailsUseCase.invoke(id)
            
            product = detailsMapper.map(result)
        } catch let error as ProductDetailsError {
            detailsError = error
        } catch {
            detailsError = .unknown
        }
    }
}
